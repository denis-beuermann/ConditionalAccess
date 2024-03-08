Param(
  [string]$name = 'loc_GeoCloud_MEX'
)

$archiveContent = get-content '.\archive\20230427-conditionalAccessPolicies.json'
$policyContent = $archiveContent | convertfrom-json
$policyJsonFile = ($name + '.json')

#$x = $namedLocationContent.value | where-object {$_.displayname -Like "*loc_geocloud_mex*"}
function createPolicies {
  #$polHashTable = @{
  #  displayname = $item.displayname
  #}
  $polHashTable = $item
  $polHashTable.PSObject.properties.remove('id')
  $polHashTable.PSObject.properties.remove('createdDateTime')
  $polHashTable.PSObject.properties.remove('modifiedDateTime')
  return $polHashTable
}

foreach($item in $policyContent.value)
{
  
  if($item.displayName -Like "*Admin x*")
  {
    Write-Output $item.displayname
    $polHashTable = createPolicies
    $polHashTable
  }
  #$locHashTable = createNamedLocations
  #$locHashTable | convertto-json | add-content (".\templates\locations\tmp\" + $item.displayName + ".json")
}

