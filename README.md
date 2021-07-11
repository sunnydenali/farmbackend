# FARM-Intro
Introducing FARM - FastAPI, React &amp; MongoDB
****
**Create environment variables (Update ~/.bashrc or ~/.bash_profile)**  
export DEBUG_MODE=True
export DB_URL="mongodb://mongo_user:mongo_password@127.0.0.1:27017/farmstack"
export DB_NAME="farmstack"  

**MongoDB Cloud Atlas**  
mongodb+srv://admin:admin@cluster0.5h28s.mongodb.net/Documents?retryWrites=true&w=majority

**MongoDB localhost**  
mongodb://mongo_user:mongo_password@127.0.0.1:27017/farmstack  

**Mongodb Compass**  
mongodb://127.0.0.1:27017/?compressors=zlib&readPreference=primary&gssapiServiceName=mongodb&appname=MongoDB%20Compass&ssl=false  

****
**Virtual Environment / Dependencies set up**  
python3 -m venv venv  
source backend/venv/bin/activate  
python3 -m pip install --upgrade pip  
pip install -r backend/requirements.txt  
****
**Run the backend application**  
python3 main.py


****