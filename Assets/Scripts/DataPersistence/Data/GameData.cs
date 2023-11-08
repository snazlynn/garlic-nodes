using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]

public class GameData
{
    // Records the number of times the game was started
    // temporary so that I can actually have a changing value to save & load
    public float timesStarted;
    // In the future, maybe we store game state in here, like time left

    // Constructor initializes values for the beginning of a brand new game
    public GameData()
    {
        this.timesStarted = 0;
    }
}
