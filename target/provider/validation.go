package provider

import (
	"fmt"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func maybeAddValidateFunc(sch *schema.Schema, objectType, fieldName string) {
	if fieldName == "data" && (objectType == "notebook" || objectType == "runbook") {
		sch.ValidateFunc = func(val interface{}, key string) (warns []string, errs []error) {
			if key != "data" {
				return
			}
			extraKeys := getExtraNotebookDataFields(val)
			if len(extraKeys) > 0 {
				warns = append(warns, fmt.Sprintf(ProviderShortName+"_notebook.data field is expected to only have the following keys: cells, params, external_params and enabled, but got extra keys: %v. This may produce unwanted diffs.", extraKeys))
			}
			return
		}
	}
}

func getExtraNotebookDataFields(data interface{}) []string {
	dataObject := CastToObject(data)
	if dataObject == nil {
		return []string{}
	}
	allowedKeys := map[string]bool{"cells": true, "params": true, "external_params": true, "enabled": true}
	extraKeys := []string{}
	for k := range dataObject.(map[string]interface{}) {
		if ok := allowedKeys[k]; !ok {
			extraKeys = append(extraKeys, k)
		}
	}
	return extraKeys
}
