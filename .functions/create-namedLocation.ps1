Param(
  [string]$name = 'loc_GeoCloud_MEX'
)

$archiveContent = get-content '.\archive\20230427-namedLocations.json'
$namedLocationContent = $archiveContent | convertfrom-json
$locationJsonFile = ($name + '.json')

#$x = $namedLocationContent.value | where-object {$_.displayname -Like "*loc_geocloud_mex*"}
function createNamedLocations {
  $locHashTable = $item
  $locHashTable.PSObject.properties.remove('id')
  $locHashTable.PSObject.properties.remove('createdDateTime')
  $locHashTable.PSObject.properties.remove('modifiedDateTime')
  return $locHashTable
}

foreach($item in $namedLocationContent.value)
{
  Write-Output $item.displayname
  $locHashTable = createNamedLocations
  remove-item (".\templates\locations\tmp\" + $item.displayName + ".json") -Force -Confirm:$false
  $locHashTable | convertto-json | add-content (".\templates\locations\tmp\" + $item.displayName + ".json")
}

