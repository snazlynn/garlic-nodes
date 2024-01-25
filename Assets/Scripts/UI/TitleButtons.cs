using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.SceneManagement;

public class TitleButtons : MonoBehaviour
{
    private VisualElement root;
    private static Button save;
    private static Button load;
    private static Button exit;

    private static GameObject saveLoadObj;

    void Awake()
    {
        saveLoadObj = GameObject.Find("SavingLoadingManager");

        VisualElement root = GetComponent<UIDocument>().rootVisualElement;
        save = root.Q<Button>("Continue");
        load = root.Q<Button>("NewGame");
        exit = root.Q<Button>("Exit");

        save.clickable.activators.Clear();
        save.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        load.clickable.activators.Clear();
        load.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        exit.clickable.activators.Clear();
        exit.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
    }

    private static void MyCallback(MouseDownEvent evt)
    {
        // button clicked
        Button b = (Button)evt.currentTarget;

        if (b.name == "Continue")
        {
            if(!SaveFile.filePath.Equals(""))
            {
                DialogueVariables.variables = saveLoadObj.GetComponent<JsonDataService>().LoadData<Dictionary<string, object>>(SaveFile.filePath, false);
                SceneManager.LoadScene("PlanetSelection");
                PauseScript.unpauseGame();
            }
        }
        else if(b.name == "NewGame")
        {
            DialogueVariables.initDict = false;
            SceneManager.LoadScene("PlanetSelection");
            PauseScript.unpauseGame();
        }
        else if(b.name == "Exit")
        {
            Application.Quit();
        }
    }
}
