---
languages:
- rest
- powershell
page_type: sample
description: "Use Conditional Access Graph APIs to manage policies like code. Automate approvals to promote policies from preproduction environments, backup and restore, monitor change, and plan ahead for emergencies."
products:
- azure
- azure-active-directory
---
# Manage Conditional Access policies in Azure DevOps Pipelines

Many organizations have expressed their need to manage as much of their environments like code as possible. Using Microsoft Graph you can treat Conditional Access policies like any other piece of code in your environment.

Microsoft Graph provides a unified programmability model that organizations can use to interact with data in Microsoft 365, Windows 10, and Enterprise Mobility + Security. For more information about Microsoft Graph, see the article, [Overview of Microsoft Graph](https://docs.microsoft.com/graph/overview).

![An image showing the primary resources and relationships that are part of the graph](./media/microsoft-graph.png)

The following examples are provided as is with no support. You can use these examples as a basis for tooling in your organization.

Many of the following examples use tools like [Managed Identities](https://docs.microsoft.com/azure/active-directory/managed-identities-azure-resources/overview), [Logic Apps](https://docs.microsoft.com/azure/logic-apps/logic-apps-overview), [OneDrive](https://www.microsoft.com/microsoft-365/onedrive/online-cloud-storage), [Teams](https://www.microsoft.com/microsoft-365/microsoft-teams/group-chat-software/), and [Azure Key Vault](https://docs.microsoft.com/azure/key-vault/general/overview).

# Group ObjectId table

|Group|ObjectId|Policy|
|--|--|--|
|CA.Users.ModernWorkplace|5e769024-0f21-4be0-af23-dd6045caa1c9|Modern Workplace Users|
|CA.Users.PartnerAccounts|83f97141-dac5-4b64-8032-558e6332955b|Partner Accounts|
|CA.Users.CriticalGuests|bed30a62-40fe-4ab0-a4b1-76021e6734c7|Critical Guests|
|CA.Users.AdminAccounts|9ce774f2-848f-4814-9d28-22aaa7b255fe|Admin Accounts|
|CA.Users.LegacyAuthentication|6424e446-c617-4f23-89f5-ec2d7fe08922|Legacy Authentication Accounts|
|CA.Users.PerUserMfaTransition|c62f7bfe-a349-4ccc-8326-0808c9282a28|
|CloudPAW.Groups.Users.Tier0|f5ec4aaa-e33e-4562-bb83-6f014478cbab|
|CloudPAW.Groups.Users.Tier1-2|4db7708c-ae5e-470e-bdce-f1e410a21a6b|
|AtosAdmin|a0553820-cc4a-4256-9992-42a153ca4413|
|ResAz.GKGABAdmins|6f53f0e7-ca6b-4bd5-9da7-d559215cd1fe|
|ResIntune.Users.MTRAccounts|0c58eb53-bd5b-4cfa-b8ea-15f969fd911b||
|ResIntune.Users.SurfaceHub|4a037dbc-3108-412c-82e2-e51296c0ea08||
|Res.CollaborationDevices|307c4c83-25ac-4bd6-8552-a07d1a6d6e9d||
|ResAz.CA.UserActionException|8d9b0486-70d1-4e10-8692-1002c6854423||

# User ObjectId table

|Group|ObjectId|Policy|Description|
|--|--|--|--|
|Natasha Romanov|f974c6fd-78b5-462f-8c22-20088cf70dec|Break Glass Account|
|Tony Stark|dafe857a-f92e-4763-a785-e01520c5f6e3|Break Glass Account|
|Sync_SAZ0003|8145ad6d-5372-4626-ad12-186b9ce0a163|Sync_SAZ0003|
|Sync_SAZ0004|45493151-3540-4d48-b311-6b98ec68f9b4|Sync_SAZ0004|


# Template properties
|Main|Property|Sublevel property|Values|
|--|--|--|--|
|displayName|||Descriptive name of the policy|
|state|||enable,disabled,enabledForReportingButNotEnforced|
|conditions|signInRiskLevels||||
||userRiskLevels|||
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
    "displayName": "Sample Template Name", 
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
                "45493151-3540-4d48-b311-6b98ec68f9b4",
                "8145ad6d-5372-4626-ad12-186b9ce0a163",
                "2300ccc8-2124-4937-84f0-3a63872af609"
            ],
            "includeGroups": [ 
                "5e769024-0f21-4be0-af23-dd6045caa1c9"
            ], 
            "excludeGroups": [
                "4db7708c-ae5e-470e-bdce-f1e410a21a6b",
                "f5ec4aaa-e33e-4562-bb83-6f014478cbab"     
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
                "7495fdc4-34c4-4d15-a289-98788ce399fd",
                "aaf43236-0c0d-4d5f-883a-6955382ac081",
                "3edaf663-341e-4475-9f94-5c398ef6c070",
                "b0f54661-2d74-4c50-afa3-1ec803f12efe",
                "158c047a-c907-4556-b7ef-446551a6b5f7",
                "7698a772-787b-4ac8-901f-60d6b08affd2",
                "17315797-102d-40b4-93e0-432062caca18",
                "e6d1a23a-da11-4be4-9570-befc86d067a7",
                "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9",
                "5c4f9dcd-47dc-4cf7-8c9a-9e4207cbfc91",
                "38a96431-2bdf-4b4c-8b6e-5d3d8abac1a4",
                "88d8e3e3-8f55-4a1e-953a-9b9898b8876b",
                "d29b2b05-8046-44ba-8758-1e26182fcf32",
                "9360feb5-f418-4baa-8175-e2a00bac4301",
                "8329153b-31d0-4727-b945-745eb3bc5f31",
                "44367163-eba1-44c3-98af-f5787879f96a",
                "29232cdf-9323-42fd-ade2-1d097af3e4de",
                "6e591065-9bad-43ed-90f3-e9424366d2f0",
                "0f971eea-41eb-4569-a71e-57bb8a3eff1e",
                "be2f45a1-457d-42af-a067-6ec1fa63bc45",
                "62e90394-69f5-4237-9190-012177145e10",
                "f2ef992c-3afb-46b9-b7cf-a126ee74c451",
                "fdd7a751-b60b-444a-984c-02652fe8fa1c",
                "95e79109-95c0-4d8e-aee3-d01accf2d47b",
                "729827e3-9c14-49f7-bb1b-9608f156bbb8",
                "8ac3fc64-6eca-42ea-9e69-59f4c7b60eb2",
                "eb1f4a8d-243a-41f0-9fbd-c7cdf6c5ef7c"
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

### PowerShell

For many administrators, PowerShell is already an understood scripting tool. The following example shows how to use the [Azure AD PowerShell module](https://www.powershellgallery.com/packages/AzureAD) to manage Conditional Access policies.

- [Configure Conditional Access policies with Azure AD PowerShell commands](./01-configure/powershell/readme.md)

### Graph API

This example shows the basic Create, Read, Update, and Delete (CRUD) options available in the Conditional Access Graph APIs. The example also includes some JSON templates you can use to create some sample policies.

- [Configure Conditional Access policies with Microsoft Graph API calls](./01-configure/graphapi/readme.md)

### Configure using templates

Use Conditional Access APIs to deploy Conditional Access policies in your pre-production environment using a template.

- [Configure Conditional Access policies with Microsoft Graph API templates](./01-configure/templates/readme.md)

## Test

This example models safer deployment practices with approval workflows that can copy Conditional Access policies from one environment, like pre-production, to another, like your production environment.

- [Promote Conditional Access policies from test environments](./02-test/readme.md)

## Deploy

This example provides a mechanism to perform a staged deployment Conditional Access policies gradually to your user population, allowing you to manage support impact and spot issues early.

- [Deploy Conditional Access policies to production environments with approval workflows](./03-deploy/readme.md)

## Monitor

This example provides a mechanism to monitor Conditional Access policy changes over time and can trigger alerts when key policies are changed.

- [Monitor deployed Conditional Access policies for changes and trigger alerts](./04-monitor/readme.md)

## Manage

### Backup and restore

Automate the backup and restoration of Conditional Access policies with approvals in Teams using this example.

- [Manage the backup and restore process of Conditional Access policies using Microsoft Graph API calls](./05-manage/01-backup-restore/readme.md)

### Emergency access accounts

Multiple administrators may create Conditional Access policies and may forget to add your [emergency access accounts](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-emergency-access) as an exclusion to those policies. This example ensures that all policies are updated to include your designated emergency access accounts.

- [Manage the assignment of emergency access accounts to Conditional Access policies using Microsoft Graph API calls](./05-manage/02-emergency-access/readme.md)

### Contingency planning

Things don't always work the way you want, when that happens you need a way to get back to a state where work can continue. The following example provides you a way to revert your policies to a known good contingency plan and disable other Conditional Access policies.

- [Manage the activation of Conditional Access contingency policies using Microsoft Graph API calls](./05-manage/03-contingency/readme.md)

## Community contribution

We are happy to support community contributions thorough GitHub Issues and Pull Requests in this [GitHub repository](https://github.com/Azure-Samples/azure-ad-conditional-access-apis).

## Next steps

- [Overview of Microsoft Graph](https://docs.microsoft.com/graph/overview)
- [Conditional Access API](https://docs.microsoft.com/graph/api/resources/conditionalaccesspolicy?view=graph-rest-1.0)
- [Named location API](https://docs.microsoft.com/graph/api/resources/namedlocation?view=graph-rest-1.0)
