# ConditionalAccess
This repository contains samples for Conditional Access deployments via pipeline 
## Requirements
DevOps Service Principal Connection
App Registration with GraphPermission (I would recommend a dedicated to the DevOps Service Principal)

## Recommendation
Store the sectret of your app registration in Azure KeyVault

# Template properties
|Main|Property|Sublevel property|Values|
|--|--|--|--|
|displayName|||Descriptive name of the policy|
|state|||enable,disabled,enabledForReportingButNotEnforced|
|conditions|signInRiskLevels|||High, Medium, Low|
||userRiskLevels||High, Medium, Low|
||clientAppTypes|||browser,mobileAppsAndDesktopClients,exchangeActiveSync,others|
||platforms|includePlatforms|All,android,iOS|
|||excludePlatforms|All,android,iOS|
||applications|includeApplications|All|
|||excludeApplications||
||users|includeUsers||
|||excludeUsers||
|||includeGroups||  
|||excludeGroups||
|||includeRoles||    
|||excludeRoles||
||devices|includeDeviceStates||
|||excludeDeviceStates||
|||includeDevices|All|
|||excludeDevices||
|||deviceFilter||

    Example:
    { 
    "displayName": "Workplace 1 - Allow compliant device rich apps", 
    "state": "disabled", 
    "conditions": { 
        "signInRiskLevels": [],
        "userRiskLevels": [],
        "clientAppTypes": [
            "mobileAppsAndDesktopClients"
        ],
        "platforms": {
            "includePlatforms": [
                "All"
            ],
            "excludePlatforms": [
                "iOS",
                "android"
            ]
        },
        "applications": { 
            "includeApplications": [ 
                "All" 
            ],
            "excludeApplications": [
                "d4ebce55-015a-49b5-a083-c84d1797ae8c"
            ]
        }, 
        "users": { 
            "includeUsers": [
            ],
            "excludeUsers": [
                "GuestsOrExternalUsers",
                "45777751-3540-4222-b991-62222222f9b4",
                "8777777d-5372-4226-a992-186444444163",
                "66666668-2124-4227-990-3a444444f609"
            ],
            "includeGroups": [ 
                "5999024-0f21-99e0-af23-dd6099999a1c9"
            ], 
            "excludeGroups": [
                "4999908c-a77e-412e-b8c8-f77777a21888",
                "f599999a-e377-4002-8883-888147777ba8"     
            ],
            "includeRoles": [    
            ],
            "excludeRoles": [
                "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3",
                "cf1c38e5-3621-4004-a7cb-879624dced7c",
                "9c6df0f2-1e7c-4dc3-b195-66dfbd24aa8f",
                "c430b396-e693-46cc-96f3-db01bf8bb62a",
                "c4e39bd9-1100-46d3-8c65-fb160da0071f",
                "0526716b-113d-4c15-b2c8-68e3c22b9f80",
                "9f06204d-73c1-4d4c-880a-6edb90606fd8",
                "e3973bdf-4987-49ae-837a-ba8e231c7286",
                "7495fdc4-34c4-4d15-a289-98788ce399fd"
            ]
        }
    }, 
    "grantControls": { 
        "operator": "OR", 
        "builtInControls": [ 
             "compliantDevice"
        ] 
    } 
}
