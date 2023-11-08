using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO;

public class FileDataHandler
{
    private string dataDirectoryPath = "";
    private string dataFileName = "";

    // The logic for when we should encrypt is not yet implemented
    // I personally think modifying save files is funny
    private readonly string encryptionCodeWord = "sanguinity";


    public FileDataHandler(string dataDirectoryPath, string dataFileName)
    {
        this.dataDirectoryPath = dataDirectoryPath;
        this.dataFileName = dataFileName;
    }


    public GameData Load()
    {
        // Accounts for differing OS file separators
        string fullPath = Path.Combine(dataDirectoryPath, dataFileName);

        GameData loadedData = null;
        if (File.Exists(fullPath))
        {
            try
            {
                // Load data from file
                string dataToLoad = "";
                using (FileStream stream = new FileStream(fullPath, FileMode.Open))
                {
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        dataToLoad = reader.ReadToEnd();
                    }
                }

                // De-serialize data
                loadedData = JsonUtility.FromJson<GameData>(dataToLoad);
            }
            catch (Exception e)
            {
                Debug.LogError("FileDataHandler: Error occured while trying to load data from file " + fullPath + "\n" + e);
            }
        }

        return loadedData;
    }


    public void Save(GameData data)
    {
        // Accounts for differing OS file separators
        string fullPath = Path.Combine(dataDirectoryPath, dataFileName);

        try
        {
            // Ensure directory is created
            Directory.CreateDirectory(Path.GetDirectoryName(fullPath));

            // Serialize data to Json
            string dataToSave = JsonUtility.ToJson(data, true);

            // Write serialized data to file
            using (FileStream stream = new FileStream(fullPath, FileMode.Create))
            {
                using(StreamWriter writer = new StreamWriter(stream))
                {
                    writer.Write(dataToSave);
                }
            }
        }
        catch (Exception e)
        {
            Debug.LogError("FileDataHandler: Error occured while trying to save data to file " + fullPath + "\n" + e);
        }
    }


    /**
     * Returns a string modified with XOR encryption against a specified code word
     */
    private string encryptAndDecryptData(string data)
    {
        string modifiedData = "";
        for (int i = 0; i < data.Length; i++)
        {
            modifiedData += (char)(data[i] ^ encryptionCodeWord[i % encryptionCodeWord.Length]);
        }
        return modifiedData;
    }
}
