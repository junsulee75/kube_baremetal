package main

// don't use this, in test yet.
import (
	"fmt"
	"io/ioutil"

	"gopkg.in/yaml.v3"
)

func main() {
	// Read the YAML file
	inputFile := "input.yaml"   // Replace with your YAML file path
	outputFile := "output.yaml" // Output file to save the modified YAML

	data, err := ioutil.ReadFile(inputFile)
	if err != nil {
		fmt.Println("Error reading file:", err)
		return
	}

	// Parse YAML content into a generic map
	var content []map[string]interface{}
	err = yaml.Unmarshal(data, &content)
	if err != nil {
		fmt.Println("Error parsing YAML:", err)
		return
	}

	// Find the specific DaemonSet and container
	for _, item := range content {
		if item["kind"] == "DaemonSet" {
			metadata := item["metadata"].(map[string]interface{})
			if metadata["name"] == "kube-flannel-ds" {
				// Locate containers section
				spec := item["spec"].(map[string]interface{})
				template := spec["template"].(map[string]interface{})
				templateSpec := template["spec"].(map[string]interface{})
				containers := templateSpec["containers"].([]interface{})

				// Locate the specific container and add the argument
				for _, container := range containers {
					containerMap := container.(map[string]interface{})
					if containerMap["name"] == "kube-flannel" {
						args := containerMap["args"].([]interface{})
						// Add "--iface=eth0" if it doesn't exist
						ifaceExists := false
						for _, arg := range args {
							if arg == "--iface=eth0" {
								ifaceExists = true
								break
							}
						}
						if !ifaceExists {
							containerMap["args"] = append(args, "--iface=eth0")
						}
					}
				}
			}
		}
	}

	// Marshal the modified content back to YAML format
	modifiedData, err := yaml.Marshal(content)
	if err != nil {
		fmt.Println("Error marshaling modified YAML:", err)
		return
	}

	// Write the modified YAML back to the output file
	err = ioutil.WriteFile(outputFile, modifiedData, 0644)
	if err != nil {
		fmt.Println("Error writing modified file:", err)
		return
	}

	fmt.Println("Modification complete. Output saved to", outputFile)
}
