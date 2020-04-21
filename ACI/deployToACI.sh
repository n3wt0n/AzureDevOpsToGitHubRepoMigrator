echo "Insert the name of the Resource Group  where to Deploy the Container Instance (ACI):"

read resGroup

echo "Deploying ACI to $resGroup..."

az container create --resource-group $resGroup --file deploy-aci.yaml