using System;
using System.Reflection;

static class BuildCommand
{

    private static void SyncSolution() {
        Type
            .GetType("Packages.Rider.Editor.RiderScriptEditor, Unity.Rider.Editor")
            .GetMethod("SyncSolution", BindingFlags.Static | BindingFlags.Public)
            .Invoke(null, Array.Empty<object>());

    }
}