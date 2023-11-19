/** Interface used to implement an object that can save and load data.
 * Currently just JsonDataService. If we want multiple behaviors for saving & loading data, that's possible in theory. 
 * If you want your own script to save and load data in its own special way, try going off of this interface. */
public interface IDataService
{
    bool SaveData<T>(string RelativePath, T Data, bool Encrypted);

    T LoadData<T>(string RelativePath, bool Encrypted);
}