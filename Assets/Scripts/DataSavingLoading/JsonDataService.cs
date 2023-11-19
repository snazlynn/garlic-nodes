using Newtonsoft.Json;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

/**
 * This class handles saving and loading files in a Json format. This is meant to be a Singleton class. 
 * System adapted from tutorial by LlamAcademy: https://www.youtube.com/watch?v=mntS45g8OK4 */
public class JsonDataService : MonoBehaviour, IDataService
{
    public static JsonDataService Instance { get; private set; }

    private const string KEY = "ggdPhkeOoiv6YMiPWa34kIuOdDUL7NwQFg6l1DVdwN8=";
    private const string IV = "JZuM0HQsWSBVpRHTeRZMYQ==";

    /** This method serializes and saves data to a specified file name or relative path. 
     * Returns true when it succeeds in writing, false otherwise. */
    public bool SaveData<T>(string RelativePath, T Data, bool Encrypted)
    {
        string path = Application.persistentDataPath + RelativePath;

        try
        {
            // When the file already exists, we completely overwrite it!
            // I don't know enough about IO to do anything fancy yet.
            if (File.Exists(path))
            {
                Debug.Log("JsonDataService: Data exists. Deleting old file and writing a new one!");
                File.Delete(path);
            }
            else
            {
                Debug.Log("JsonDataService: Writing file for the first time!");
            }

            // This part actually writes the file
            using FileStream stream = File.Create(path);
            if (Encrypted)
            {
                WriteEncryptedData(Data, stream);
            }
            else
            {
                stream.Close();
                File.WriteAllText(path, JsonConvert.SerializeObject(Data)); // The magical important line that does the writing
            }
            return true;
        }

        catch (Exception e)
        {
            Debug.LogError($"JsonDataService: Unable to save data due to: {e.Message} {e.StackTrace}");
            return false;
        }
    }

    // This method is supposed to encrypt serialized data. Untested
    private void WriteEncryptedData<T>(T Data, FileStream Stream)
    {
        using Aes aesProvider = Aes.Create();
        aesProvider.Key = Convert.FromBase64String(KEY);
        aesProvider.IV = Convert.FromBase64String(IV);
        using ICryptoTransform cryptoTransform = aesProvider.CreateEncryptor();
        using CryptoStream cryptoStream = new CryptoStream(
            Stream,
            cryptoTransform,
            CryptoStreamMode.Write
        );

        // You can uncomment the below to see a generated value for the IV & key.
        // You can also generate your own if you wish
        //Debug.Log($"Initialization Vector: {Convert.ToBase64String(aesProvider.IV)}");
        //Debug.Log($"Key: {Convert.ToBase64String(aesProvider.Key)}");
        cryptoStream.Write(Encoding.ASCII.GetBytes(JsonConvert.SerializeObject(Data)));
    }


    /** This method loads and deserializes data from a specified relative path.
     * It returns the object it deserialized, or null if it fails I think. 
     * It also throws some exceptions on certain errors get your catcher's glove */
    public T LoadData<T>(string RelativePath, bool Encrypted)
    {
        string path = Application.persistentDataPath + RelativePath;

        // Can't read it if it doesn't exist.
        // In this case, you should probably initialize your object to a default value, like at the start of the game.
        if (!File.Exists(path))
        {
            Debug.LogError($"JsonDataService: Cannot load file at {path}. File does not exist!");
            throw new FileNotFoundException($"{path} does not exist!");
        }

        try
        {
            T data;
            if (Encrypted)
            {
                data = ReadEncryptedData<T>(path);
            }
            else
            {
                data = JsonConvert.DeserializeObject<T>(File.ReadAllText(path)); // Magical important line that deserializes data
            }

            return data;
        }
        catch (Exception e)
        {
            // Some other error we didn't expect lol
            Debug.LogError($"JsonDataService: Failed to load data due to: {e.Message} {e.StackTrace}");
            throw e;
        }
    }

    // This method is supposed to decrypt data. Untested
    private T ReadEncryptedData<T>(string Path)
    {
        byte[] fileBytes = File.ReadAllBytes(Path);
        using Aes aesProvider = Aes.Create();

        aesProvider.Key = Convert.FromBase64String(KEY);
        aesProvider.IV = Convert.FromBase64String(IV);

        using ICryptoTransform cryptoTransform = aesProvider.CreateDecryptor(
            aesProvider.Key,
            aesProvider.IV
        );
        using MemoryStream decryptionStream = new MemoryStream(fileBytes);
        using CryptoStream cryptoStream = new CryptoStream(
            decryptionStream,
            cryptoTransform,
            CryptoStreamMode.Read
        );
        using StreamReader reader = new StreamReader(cryptoStream);

        string result = reader.ReadToEnd();

        Debug.Log($"JsonDataService: Decrypted result (if the following is not legible, probably wrong key or iv): {result}");
        return JsonConvert.DeserializeObject<T>(result);
    }

    private void Awake()
    {
        CreateSingleton();
    }

    /** This method ensures JsonDataService remains a singleton, by creating one if needed, and destoying accidental multiples.
     The JsonDataService singleton currently gets initialized in the Titlescreen scene by the gameobject DataPersistence.*/
    void CreateSingleton()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(this);
            return;
        }
        else
        {
            Instance = this;
        }

        DontDestroyOnLoad(gameObject);
    }
}