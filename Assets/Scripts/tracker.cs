using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class tracker : MonoBehaviour
{

    public static tracker Instance;

    public static IDictionary<string, Quaternion> rotations;

    public static IDictionary<string, int> affinities;

    public static float moonRadius = 0f;
    public static string lastScene;

    void Awake()
    {
        if (Instance != null)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);

        rotations.Add("Mercury", Quaternion.identity);
        rotations.Add("Venus", Quaternion.identity);
        rotations.Add("Earth", Quaternion.identity);
        rotations.Add("Mars", Quaternion.identity);
        rotations.Add("Jupiter", Quaternion.identity);
        rotations.Add("Saturn", Quaternion.identity);
        rotations.Add("Uranus", Quaternion.identity);
        rotations.Add("Neptune", Quaternion.identity);
        rotations.Add("Pluto", Quaternion.identity);

        affinities.Add("Mercury", 0);
        affinities.Add("Venus", 0);
        affinities.Add("Earth", 0);
        affinities.Add("Mars", 0);
        affinities.Add("Jupiter", 0);
        affinities.Add("Saturn", 0);
        affinities.Add("Uranus", 0);
        affinities.Add("Neptune", 0);
        affinities.Add("Pluto", 0);
    }
}
