# Inventory Local

This is a file based inventory.

* Log in to your AAP (point your browser to https://controller.example.local - but replace it with your controller URL).
* go to Inventories, select **Add** for each one.

* Name: Local Inventory
* Organization: Gonoph
* Click **Save**
* Click **Hosts** tab (you will not add Sources)
* Click **Add** button

```yaml
Name: localhost
```

Variables:

```yaml
  ansible_connection: local
  ansible_python_interpreter: '{{ ansible_playbook_python }}'
```

* Click **Save**
