using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.Windows.Speech;
using UnityEditor.UIElements;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private float textSpeed = 0.02f;
    [SerializeField] private Sentences sentences;
    [SerializeField] private Questions questions;

    private int questionIndex;
    private int sentenceIndex;
    private int sentencesIndex;
    private Label speech;
    private Label speakerName;
    private Button option1;
    private Button option2;
    private Button option3;
    private bool endOfSentences;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void StartDialogue(Label name, Label speech, Button option1, Button option2, Button option3) 
    {
        this.questionIndex = 0;
        this.sentenceIndex = 0;
        this.sentencesIndex = 0;
        this.speech = speech;
        this.speakerName = name;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;

        Debug.Log("conversation started");
        DisplayNextSentence();
    }
    public void DisplayNextSentence() 
    {
        try
        {
            endOfSentences = false;
            StopAllCoroutines();
            StartCoroutine(TypeSentence(this.sentences.sentences.rows[this.sentencesIndex].row[this.sentenceIndex]));
            this.sentenceIndex++;
        }
        catch (IndexOutOfRangeException) 
        {
            this.endOfSentences = true;
            this.sentenceIndex = 0;
            DisplayNextQuestion();
        }
    }
    public void DisplayNextQuestion() 
    {
        //Implement try catch block for IndexOutOfRangeException idicating that the conversation is over
        try
        {
            if (questions.questions.rows[this.questionIndex].row.Count() == 2)
            {
                this.option1.style.display = DisplayStyle.Flex;
                this.option2.style.display = DisplayStyle.Flex;

                this.option1.text = questions.questions.rows[this.questionIndex].row[0];
                this.option2.text = questions.questions.rows[this.questionIndex].row[1];
            }
            else
            {
                this.option1.style.display = DisplayStyle.Flex;
                this.option2.style.display = DisplayStyle.Flex;
                this.option3.style.display = DisplayStyle.Flex;

                this.option1.text = questions.questions.rows[this.questionIndex].row[0];
                this.option2.text = questions.questions.rows[this.questionIndex].row[1];
                this.option3.text = questions.questions.rows[this.questionIndex].row[2];
            }
        }
        catch (IndexOutOfRangeException) 
        {
            SceneManager.LoadScene("PlanetSelection");
        }
        this.questionIndex++;
        option1.clicked += () =>
        {
            this.sentencesIndex++;
            this.option1.style.display = DisplayStyle.None;
            this.option2.style.display = DisplayStyle.None;
            this.option3.style.display = DisplayStyle.None;
            DisplayNextSentence();
            return;
        };
        option2.clicked += () =>
        {
            this.sentencesIndex += 2;
            this.option1.style.display = DisplayStyle.None;
            this.option2.style.display = DisplayStyle.None;
            this.option3.style.display = DisplayStyle.None;
            DisplayNextSentence();
            return;
        };
        option3.clicked += () =>
        {
            this.sentencesIndex += 3;
            this.option1.style.display = DisplayStyle.None;
            this.option2.style.display = DisplayStyle.None;
            this.option3.style.display = DisplayStyle.None;
            DisplayNextSentence();
            return;
        };
    }
    IEnumerator TypeSentence(string sentence)
    {
        char[] sentenceArray = sentence.ToCharArray();
        if (String.Equals('0', sentenceArray[sentenceArray.Count() - 1])) 
        {
            this.speakerName.text = "Moon";
        }
        else 
        {
            this.speakerName.text = sentences.planetName;
        }
        sentenceArray = sentenceArray.SkipLast(1).ToArray();
        this.speech.text = "";
        foreach (char letter in sentenceArray) 
        {
            this.speech.text += letter;
            yield return new WaitForSeconds(textSpeed);
        }
    }
    void Update()
    {
        if (Input.GetMouseButtonDown(0) && !endOfSentences) 
        {
            DisplayNextSentence();
        }
    }
}
