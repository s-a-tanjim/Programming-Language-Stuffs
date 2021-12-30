## Commands
```sh
$ pip list # Show all the packages
          --local # Only show local installed package list
$ python -m venv project_name/venv # Create virtual environment
          --system-site-packages # Allow use global packages in local env
$ source project_name/venv/bin/activate # Activate venv
$ which python # Check the used python path
$ pip freeze > requirements.txt # Save dependencies to requirements.txt file
$ deactivate # Exit virtual environment
$ pip install -r requirements.txt # Install all packages from requirements.txt file

```

## File Structure
```sh
project_file/
  ---/venv
  ---/app.py
  ---/other_scripts.py
```