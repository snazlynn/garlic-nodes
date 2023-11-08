using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

// Singleton
public class DataPersistenceManager : MonoBehaviour
{
    [Header("File Storage Config")]
    [SerializeField] private string fileName;

    private GameData gameData;
    private List<IDataPersistence> dataPersistenceObjects;
    private FileDataHandler dataHandler;

    public static DataPersistenceManager instance { get; private set; }

    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogError("DataPersistenceManager: Error: Found more than one Data Persistence Manager in the scene.");
        }
        instance = this;
    }

    private void Start()
    {
        this.dataHandler = new FileDataHandler(Application.persistentDataPath, fileName);
        this.dataPersistenceObjects = FindDataPersistenceObjects();
    }

    public void NewGame()
    {
        this.gameData = new GameData();
    }

    /**
     * Loads the saved game, or if there is none, creates a new game.
     * This method is called by Titlescreen.cs when the player clicks the play button.
     * If we were to implement a "New Game" vs "Continue" button sort of setup, it could be changed easily.
     */
    public void LoadGame()
    {
        // Load save from file using data handler
        this.gameData = dataHandler.Load();

        // If no save data was found, creates a new game.
        if(this.gameData == null)
        {
            Debug.LogError("DataPersistenceManager: No data found. Initializing to default values.");
            NewGame();
        }

        // Push the data to other scripts that need it
        foreach (IDataPersistence dataPersistenceObj in dataPersistenceObjects)
        {
            dataPersistenceObj.LoadData(gameData);
        }
    }

    /**
     * Saves the game to a file speficied in the editor.
     * TODO call this somewhere
     */
    public void SaveGame()
    {
        // Pass gameData to other scripts so they can update it
        foreach (IDataPersistence dataPersistenceObj in dataPersistenceObjects)
        {
            dataPersistenceObj.SaveData(ref gameData);
        }

        // save to file using data handler
        dataHandler.Save(gameData);
    }

    private List<IDataPersistence> FindDataPersistenceObjects()
    {
        IEnumerable<IDataPersistence> dataPersistenceObjects = FindObjectsOfType<MonoBehaviour>().OfType<IDataPersistence>();

        return new List<IDataPersistence>(dataPersistenceObjects);
    }
}
