using System;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class Titlescreen : MonoBehaviour
{
    // These private variables are for testing the file saving and loading system
    private int numTimesOpened = 0; 
    private string filePath = "" + Path.DirectorySeparatorChar + "intTestFile.json";

    /** Helper method for testing the file saving and loading system */
    private void loadData()
    {
        try
        {
            numTimesOpened = JsonDataService.Instance.LoadData<int>(filePath, false);
        } catch (Exception e)
        {
            Debug.Log("Titlescreen: Error loading data. Likely no file found. " + e);
            numTimesOpened = 0;
        }
        numTimesOpened++;

        Debug.Log($"Times opened: { numTimesOpened } ");
    }

    /** Some parts added to this method as a test of the file saving and loading system. */
    private void Awake()
    {
        loadData();

        VisualElement root = GetComponent<UIDocument>().rootVisualElement;
        root.Q<Button>("Play").clicked += () =>
        {
            try
            {
                JsonDataService.Instance.SaveData<int>(filePath, numTimesOpened, false);
            } catch(Exception e)
            {
                Debug.Log("Titlescreen: Error saving data" + e);
            }

            SceneManager.LoadScene("PlanetSelection");
        };
        root.Q<Button>("Quit").clicked += () => Application.Quit();
    }
}
