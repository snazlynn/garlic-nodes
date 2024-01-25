using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using Ink.Runtime;
using Ink.UnityIntegration;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    // ink files
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private TextAsset globalJSON;

    // this dialogue manager obj
    private static DialogueManager instance;
    
    // getting dialogue ui
    private VisualElement dialoguePanel;

    // dialogue box
    private Label dialogueText;
    private Label name;

    private List<VisualElement> choiceButtons; // button ui in list
    private List<Button> buttonList; // actual order of buttons

    // choice ui
    private Button option0;
    private Button option1;
    private Button option2;
    private Button option3;
    private Button option4;

    // ink story
    private Story currentStory;
    private Story globalStory;
    private bool dialogueIsPlaying;
    private Coroutine displayLineCoroutine;
    private bool canContinueNext = false;

    // ink tags
    private const string SPEAKER_TAG = "speaker";
    private const string PORTRAIT_TAG = "portrait";

    // instantiating instance
    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogWarning("Found more than one instance of Dialogue Manager");
        }
        instance = this;
        DialogueVariables.setDict();
    }

    // returns this instance
    public static DialogueManager GetInstance()
    {
        return instance;
    }

    // starts dialogue mode once you enter scene
    private void Start()
    {
        // instantiates all ui elements to the ui doc
        dialoguePanel = GetComponent<UIDocument>().rootVisualElement;
        name = dialoguePanel.Q<Label>("Name");
        dialogueText = dialoguePanel.Q<Label>("Speech");

        choiceButtons = dialoguePanel.Query(className: "button").ToList();  
        option0 = (Button) choiceButtons[2];
        option1 = (Button) choiceButtons[1];
        option2 = (Button) choiceButtons[3];
        option3 = (Button) choiceButtons[0];
        option4 = (Button) choiceButtons[4];

        buttonList = new List<Button>();
        buttonList.Add(option0);
        buttonList.Add(option1);
        buttonList.Add(option2);
        buttonList.Add(option3);
        buttonList.Add(option4);

        currentStory = new Story(inkJSON.text);
        globalStory = new Story(globalJSON.text);
        DialogueVariables.VariablesToStory(currentStory);

        // updates variable dict whenever var changes
        currentStory.ObserveVariables(DialogueVariables.variableKeys, (variableName, newValue) =>
        {
            DialogueVariables.VariableChanged(variableName, newValue);
        });

        HideButtons();
        EnterDialogueMode();
    }

    private void Update()
    {
        if(!dialogueIsPlaying)
        {
            return;
        }
        // goes to next line/shows choices/ends conversation if clicked and line is done typing
        if(canContinueNext && Input.GetMouseButtonDown(0) && !PauseScript.isPaused)
        {
            ContinueStory();
        }
    }

    public void EnterDialogueMode()
    {
        dialogueIsPlaying = true;
        dialoguePanel.visible = true;
        ContinueStory();
    }

    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialoguePanel.visible = false; // SetActive()
        dialogueText.text = "";
        HideButtons();
    }

    // if there's more text, continue, otherwise exit
    private void ContinueStory()
    {
        List<Choice> currentChoices = currentStory.currentChoices;
        if(currentStory.canContinue)
        {
            // sets dialogue box text
            nextLine();
        }
        else
        {
            // after dialogue runs out, shows choices if there are any
            if(currentStory.currentChoices.Count > 0)
            {
                DisplayChoices();
            }
            // otherwise exit
            else
            {
                ChangeScenes();
            }
        }
    }

    private void ChangeScenes()
    {
        // on the first day, allow all 5 interactions w planets
        if(Comparer.DefaultInvariant.Compare(currentStory.variablesState["currentDay"], 1) == 0 && 
            Comparer.DefaultInvariant.Compare(currentStory.variablesState["dayInteractions"], 5) == 0)
        {
            SceneManager.LoadScene("Cutscene");
        }
        // otherwise allow 4
        else if(Comparer.DefaultInvariant.Compare(currentStory.variablesState["dayInteractions"], 4) == 0)
        {
            SceneManager.LoadScene("Cutscene");
        }
        else
        {
            ExitDialogueMode();
            SceneManager.LoadScene("PlanetSelection");
        }
    }

    private void nextLine()
    {
        // prevents 2 coroutines from playing at once
        if(displayLineCoroutine != null)
        {
            StopCoroutine(displayLineCoroutine);
        }
        displayLineCoroutine = StartCoroutine(DisplayLine(currentStory.Continue()));

        HandleTag(currentStory.currentTags);
    }

    // prints one letter at a time
    private IEnumerator DisplayLine(string line)
    {
        dialogueText.text = "";
        canContinueNext = false;

        foreach(char letter in line.ToCharArray())
        {
            // checks if the mouse was clicked and if it's not clicking to go to the next line
            // kind of buggy though sometimes it doesn't register the mouse click or something idk
            if(Input.GetMouseButtonDown(0) && dialogueText.text.Length > 0 && !PauseScript.isPaused)
            {
                dialogueText.text = line;
                break;
            }
            dialogueText.text += letter;
            yield return new WaitForSeconds(0.017f);
        }

        canContinueNext = true;
    }

    private void HandleTag(List<string> currentTags)
    {
        foreach(string tag in currentTags)
        {
            string[] splitTag = tag.Split(':');
            if(splitTag.Length != 2)
            {
                Debug.LogError("Tag could not be properly parsed: " + tag);
            }

            // gets rid of whitespaces
            string tagKey = splitTag[0];
            string tagValue = splitTag[1];

            switch(tagKey)
            {
                case SPEAKER_TAG:
                    name.text = tagValue;
                    break;
                case PORTRAIT_TAG:
                    Debug.Log("Portrait: " + tagValue);
                    break;
                default:
                    Debug.LogWarning("Tag came in but is currently not being handled :" + tag);
                    break;
            }
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices; // gets all choices from text file

        if(currentChoices.Count > choiceButtons.Count)
        {
            Debug.LogError("More choices were given than UI can support." + choiceButtons.Count);
        }

        int index = 0;
        List<VisualElement> visibleButtons = new List<VisualElement>();
        foreach(Choice c in currentChoices)
        {
            buttonList[index].visible = true; // makes next button visible
            visibleButtons.Add(buttonList[index]);
            ((Button)buttonList[index]).text = c.text; // sets ui text = choice text
            index++;
        }

        // if there is at least one choice and dialogue is done printing
        if(visibleButtons.Count > 0  && canContinueNext && !PauseScript.isPaused)
        {
            // who needs to learn programming languages when you can spend 4 hours crawling through documentation and 12 year old forums 
            // just to copy and paste two lines of sample code LET'S GO
            // i have no idea what this callback shit does i guess it checks if the button was clicked or something
            option0.clickable.activators.Clear();
            option0.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
            option1.clickable.activators.Clear();
            option1.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
            option2.clickable.activators.Clear();
            option2.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
            option3.clickable.activators.Clear();
            option3.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
            option4.clickable.activators.Clear();
            option4.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        }
    }

    // i think this picks a choice idk
    void MyCallback(MouseDownEvent evt)
    {
        // button clicked
        Button b = (Button)evt.currentTarget;

        if (evt.eventTypeId == MouseDownEvent.TypeId())
        {
            // picks choice from story by taking the button name as an index
            currentStory.ChooseChoiceIndex( ((int) int.Parse(b.name)) );

            // displays dialogue for choice picked
            nextLine();
            HideButtons();
        }
    }

    private void HideButtons()
    {
        int index = 0;
        foreach(Button choice in choiceButtons)
        {
            choice.visible = false;
            index++;
        }
    }
}
