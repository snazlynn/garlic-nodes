using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class DialogueVariables
{
    // maps variable name to value of variable
    private Dictionary<string, object> variables;

    public DialogueVariables(Story globalVariablesStory)
    {
        variables = new Dictionary<string, object>();
        foreach(string name in globalVariablesStory.variablesState)
        {
            object value = globalVariablesStory.variablesState[name];
            variables.Add(name, value);
            Debug.Log("initialized global dialogue variable " + name + " = " + value);
        }
    }
    public void StartListening(Story story)
    {
        VariablesToStory(story);
        story.variablesState.variableChangedEvent += VariableChanged;
    }

    public void StopListening(Story story)
    {
        story.variablesState.variableChangedEvent += VariableChanged;
    }

    private void VariableChanged(string name, object value)
    {
        // updates variable in dictionary
        if(variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
        //Debug.Log("variable changed " + name + " = " + value);
    }

    // loads all updated variables into ink story
    private void VariablesToStory(Story story)
    {
        foreach(KeyValuePair<string, object> variable in variables)
        {
            story.variablesState[variable.Key] = variable.Value;
            
        }
    }
}
