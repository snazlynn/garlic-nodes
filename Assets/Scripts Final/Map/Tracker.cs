using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tracker : MonoBehaviour
{

    public static Tracker Instance;

    public static Dictionary<string, Vector3> positions;

    public static Dictionary<string, int> affinities;

    public static Dictionary<string, float> startPositions;

    public static string lastScene = "";

    public static string orbiting = "";

    void Awake()
    {
        if (Instance != null){
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);

        positions = new Dictionary<string, Vector3>();

        positions.Add("Mercury", Vector3.zero);
        positions.Add("Venus", Vector3.zero);
        positions.Add("Earth", Vector3.zero);
        positions.Add("Mars", Vector3.zero);
        positions.Add("Jupiter", Vector3.zero);
        positions.Add("Saturn", Vector3.zero);
        positions.Add("Uranus", Vector3.zero);
        positions.Add("Neptune", Vector3.zero);
        positions.Add("Pluto", Vector3.zero);

        affinities = new Dictionary<string, int>();

        affinities.Add("Mercury", 0);
        affinities.Add("Venus", 0);
        affinities.Add("Earth", 0);
        affinities.Add("Mars", 0);
        affinities.Add("Jupiter", 0);
        affinities.Add("Saturn", 0);
        affinities.Add("Uranus", 0);
        affinities.Add("Neptune", 0);
        affinities.Add("Pluto", 0);

        startPositions = new Dictionary<string, float>();

        startPositions.Add("Mercury", 10f);
        startPositions.Add("Venus", 25f);
        startPositions.Add("Earth", 40f);
        startPositions.Add("Mars", 55f);
        startPositions.Add("Jupiter", 75f);
        startPositions.Add("Saturn", 95f);
        startPositions.Add("Uranus", 115f);
        startPositions.Add("Neptune", 135f);
        startPositions.Add("Pluto", 155f);
    }
}