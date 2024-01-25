using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using System.IO;
using UnityEngine.SceneManagement;

public class PauseScript : MonoBehaviour
{
    public static bool isPaused;

    private static VisualElement pausePanel;
    private static VisualElement popUp;
    private static Button save;
    private static Button load;
    private static Button exit;
    private static Button yes;
    private static Button no;

    private static GameObject saveLoadObj;

    void Awake()
    {
        isPaused = false;
        saveLoadObj = GameObject.Find("SavingLoadingManager");

        pausePanel = GetComponent<UIDocument>().rootVisualElement;
        popUp = pausePanel.Q<VisualElement>("PopUp");
        save = pausePanel.Q<Button>("Save");
        load = pausePanel.Q<Button>("Load");
        exit = pausePanel.Q<Button>("Exit");
        yes = pausePanel.Q<Button>("Yes");
        no = pausePanel.Q<Button>("No");
        pausePanel.visible = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Debug.Log("pressed escape");
            if(isPaused)
            {
                Debug.Log("unpausing");
                unpauseGame();
            }
            else
            {
                Debug.Log("pausing");
                pauseGame();
            }
        }
    }

    private static void pauseGame()
    {
        isPaused = true;
        Time.timeScale = 0;
        pausePanel.visible = true;
        popUp.visible = false;
        buttonClick();
    }

    public static void unpauseGame()
    {
        isPaused = false;
        Time.timeScale = 1;
        pausePanel.visible = false;
    }

    private static void buttonClick()
    {
        save.clickable.activators.Clear();
        save.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        exit.clickable.activators.Clear();
        exit.RegisterCallback<MouseDownEvent>(e => MyCallback(e));

        // must have save to load
        if(!SaveFile.filePath.Equals(""))
        {
            load.clickable.activators.Clear();
            load.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        }
    }

    private static void MyCallback(MouseDownEvent evt)
    {
        // button clicked
        Button b = (Button)evt.currentTarget;
        popUp.visible = true;
        Label pLabel = popUp.Q<Label>("Question");

        yes.clickable.activators.Clear();
        no.clickable.activators.Clear();

        if (b.name == "Save")
        {
            // if it's not empty
            if(!SaveFile.filePath.Equals(""))
            {
                pLabel.text = "Overwrite save file?";
                yes.RegisterCallback<MouseDownEvent>(e => saveGame(e));
            }
            else
            {
                pLabel.text = "Create new save file?";
                yes.RegisterCallback<MouseDownEvent>(e => saveGame(e));
            }
        }
        else if(b.name == "Load")
        {
            pLabel.text = "Load save data?";
            yes.RegisterCallback<MouseDownEvent>(e => loadGame(e));
        }
        else if(b.name == "Exit")
        {
            pLabel.text = "Exit game?";
            yes.RegisterCallback<MouseDownEvent>(e => exitGame(e));
        }

        no.RegisterCallback<MouseDownEvent>(e => pressNo(e));
    }

    private static void saveGame(MouseDownEvent evt)
    {
        char separator = System.IO.Path.DirectorySeparatorChar;
        SaveFile.filePath = $"{separator}savedDict.json";
        saveLoadObj.GetComponent<JsonDataService>().SaveData<Dictionary<string, object>>(SaveFile.filePath, DialogueVariables.variables, false);
        popUp.visible = false;
    }

    private static void loadGame(MouseDownEvent evt)
    {
        DialogueVariables.variables = saveLoadObj.GetComponent<JsonDataService>().LoadData<Dictionary<string, object>>(SaveFile.filePath, false);
        SceneManager.LoadScene("PlanetSelection");
        unpauseGame();
    }

    private static void exitGame(MouseDownEvent evt)
    {
        SceneManager.LoadScene("Titlescreen");
    }

    private static void pressNo(MouseDownEvent evt)
    {
        popUp.visible = false;
    }
    
}
