# Declare a hashtable with submodule URLs as keys and submodule names as values
$submodules = @{
    "git@github.com:ThibNach/UECommonGame.git" = "Plugins/CommonGame";
    "git@github.com:ThibNach/UECommonLoadingScreen.git" = "Plugins/CommonLoadingScreen";
    "git@github.com:ThibNach/UECommonUser.git" = "Plugins/CommonUser";
    "git@github.com:ThibNach/UECoreExtensions.git" = "Plugins/CoreExtensions";
    "git@github.com:ThibNach/UEDataValidationExtensions.git" = "Plugins/DataValidationExtensions";
    "git@github.com:ThibNach/UEGameBaseFramework.git" = "Plugins/GameBaseFramework";
    "git@github.com:ThibNach/UEGameSettings.git" = "Plugins/GameSettings";
    "git@github.com:ThibNach/UEMapCheckvalidation.git" = "Plugins/MapCheckvalidation";
    "git@github.com:ThibNach/UEModularGameplayActors.git" = "Plugins/ModularGameplayActors";
    "git@github.com:ThibNach/UENamingConventionValidation.git" = "Plugins/NamingConventionValidation";
    "git@github.com:ThibNach/UEUIExtension.git" = "Plugins/UIExtension";
    "git@github.com:ThibNach/UEGameplayInteractionsExtensions.git" = "Plugins/GameplayInteractionsExtensions"
    
    "git@github.com:ProjectBorealis/UEGitPlugin" = "Plugins/GitPlugin";
}

# Path to the Git repository folder where you want to add the submodules
$gitRepoPath = Resolve-Path ( Join-Path $PSScriptRoot "..\..\" )

Write-Host $gitRepoPath

# Navigate to the Git repository folder
Set-Location -Path $gitRepoPath

# # Iterate over each entry in the hashtable and add the submodule to the Git repository
foreach ($submodule in $submodules.GetEnumerator()) {
    $url = $submodule.Key
    $name = $submodule.Value

    # Add the submodule
    git submodule add $url $name
}

# Optional: Initialize and update the submodule
git submodule update --init --recursive

# # Go back to the original location (if needed)
Pop-Location