using System;
using System.Reflection;

static class BuildCommand
{
    [SuppressMessage("ReSharper", "PossibleNullReferenceException", Justification = "Having to use reflection because of internal types.")]
    private static void SyncSolution() {
        Type
            .GetType("Packages.Rider.Editor.RiderScriptEditor, Unity.Rider.Editor")
            .GetMethod("SyncSolution", BindingFlags.Static | BindingFlags.Public)
            .Invoke(null, Array.Empty<object>());

    }
}