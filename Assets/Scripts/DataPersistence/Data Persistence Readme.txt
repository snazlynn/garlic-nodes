This file should outline instructions for using the current version of our file saving and loading system. If it doesn't, yell at me
Also, I write all this with the expectation that it actually works lol Im tired and I only tested a little int value
Not like I have much else to test yet




WHAT IT IS/HOW IT WORKS
File saving and loading is handled by a Singleton that is initialized in the title screen scene and does not delete on scene change.
It serializes objects into Json format and stores them at a specified place and name. Later, it can load this file and deserialize it 
back into an object as long as you pass it the same relative path/name.



HOW TO USE
You can access the singleton in scripts using "JsonDataService.Instance" without quotes of course. Invoke the methods SaveData and LoadData 
using this instance in order to save and load your data. Details below.

NOTE: As of right now, passing true for encryption changes nothing because it is not implemented :]




boolean SaveData<T>(string RelativeFilePath, T Data, boolean ShouldEncrypt)

RelativeFilePath: 
The relative path and name that you want to save your file at and as. IT IS STRONGLY RECOMMENDED to use Path.DirectorySeparatorChar instead 
of hardcoding a / or something. Otherwise it may break on other systems. The SaveData method itself does not check if you did this.

Data:
Any object that you wish to save. Can be as simple as an int, or more complicated with multiple parts. Be sure to specify the type of the 
object inside the angle brackets <>.

ShouldEncrypt:
When encryption is implemented, this will run the serialized data through a simple XOR encyrption algorithm before saving it.

Return: boolean
True if the data was successfully saved, false otherwise.

Example use:
string filePath = Path.DirectorySeparatorChar + "exampleNameToSave.json";
JsonDataService.SaveData<string>(filePath, "Bennifer", false);




T LoadData<T>(string RelativeFilePath, boolean WasEncrypted)
RelativeFilePath: 
The relative path and name that you are retrieving your file from. This should be the same as what you passed to SaveData.

WasEncrypted:
Once encryption is implemented, it will be necessary to specify whether we expect to need to decrypt the data.

Return: T
An object deserialized from the data. This is how you get your data back. The object's type should be specified inside the angle brackets 
when using the method.

Example use:
string filePath = Path.DirectorySeparatorChar + "exampleNameToSave.json";
PlayerName = JsonDataService.LoadData<string>(filePath, false);



It saves one object to a file. If you use the same file path, it will not add on to the file, it will destructively overwrite it. I'm not 
cool enough yet to do that. So, I would maybe recommend compiling the data you want to save into a nice little structured object before saving.

You choose when your thing-that-has-data-that-needs-to-be-saved actually loads and saves the data. Saving can probably vary. Loading makes 
the most sense to me inside of Awaken() but I dunno I don't know Unity terribly well.



Thanks for reading
Your brain tricks you into thinking