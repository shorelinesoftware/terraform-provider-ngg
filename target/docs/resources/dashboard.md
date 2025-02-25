---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "ngg_dashboard Resource - terraform-provider-ngg"
subcategory: ""
description: |-
  Nvidia GPU Guardian dashboard. A platform for visualizing resources and their associated tags.
---

# ngg_dashboard (Resource)

Nvidia GPU Guardian dashboard. A platform for visualizing resources and their associated tags.



<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `dashboard_type` (String) Specifies the type of the dashboard configuration. Currently, only 'TAGS_SEQUENCE' is supported.
- `name` (String) The name/symbol for the object within Nvidia GPU Guardian and the op language (must be unique, only alphanumeric/underscore).

### Optional

- `groups` (String) A JSON-encoded list of groups in the dashboard configuration. Each group is an object with 'name' (the group's name) and 'tags' (a list of tag names belonging to the group).
- `identifiers` (List of String) A list of additional tags that will be used to identify certain resources. They will be displayed before the tags_sequence column.
- `other_tags` (List of String) A list of additional tags that will be displayed for the resources.
- `resource_query` (String) A set of Resources (e.g. host, pod, container), optionally filtered on tags or dynamic conditions.
- `values` (String) A JSON-encoded list of objects defining the values and their associated colors in the dashboard configuration. Each object contains: 'color' (the color associated with the values) and 'values' (a list of values corresponding to specific tags).

### Read-Only

- `id` (String) The ID of this resource.
- `type` (String) The type of object (i.e., Alarm, Action, Bot, Metric, Resource, or File).
