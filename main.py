from fastapi import FastAPI
import psutil

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello DevOps! Sistem berjalan normal."}

@app.get("/health")
def health_check():
    cpu_usage = psutil.cpu_percent(interval=1)
    ram_usage = psutil.virtual_memory().percent
    
    return {
        "status": "healthy",
        "cpu_usage_percent": cpu_usage,
        "ram_usage_percent": ram_usage
    }