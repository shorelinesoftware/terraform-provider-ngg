---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "ngg_file Resource - terraform-provider-ngg"
subcategory: ""
description: |-
  Nvidia GPU Guardian file. A datafile that is automatically copied/distributed to defined Resources.
---

# ngg_file (Resource)

Nvidia GPU Guardian file. A datafile that is automatically copied/distributed to defined Resources.



<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `destination_path` (String) Target location for a copied distributed File object.
- `name` (String) The name/symbol for the object within Nvidia GPU Guardian and the op language (must be unique, only alphanumeric/underscore).
- `resource_query` (String) A set of Resources (e.g. host, pod, container), optionally filtered on tags or dynamic conditions.

### Optional

- `description` (String) A user-friendly explanation of an object.
- `enabled` (Boolean) If the object is currently enabled or disabled. Defaults to `false`.
- `inline_data` (String) The inline file data of a distributed File object. (conflicts with input_file)
- `input_file` (String) The local source of a distributed File object. (conflicts with inline_data)
- `md5` (String) The md5 checksum of a file, e.g. filemd5("${path.module}/data/example-file.txt")
- `mode` (String) The File's permissions, like 'chmod', in octal (e.g. '0644').
- `owner` (String) The File's ownership, like 'chown' (e.g. 'user:group').

### Read-Only

- `checksum` (String) Cryptographic hash (e.g. md5) of a File Resource.
- `file_data` (String) Internal representation of a distributed File object's data (computed).
- `file_length` (Number) Length, in bytes, of a distributed File object (computed)
- `id` (String) The ID of this resource.
- `type` (String) The type of object (i.e., Alarm, Action, Bot, Metric, Resource, or File).
