using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class ArrayLayout
{
    [System.Serializable]
    public struct RowData
    {
        [TextArea(1, 10)] public string[] row;
    }

    public RowData[] rows = new RowData[7];
}
