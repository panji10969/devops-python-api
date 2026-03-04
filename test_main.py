from fastapi.testclient import TestClient
from main import app

# Membuat simulasi browser/klien
client = TestClient(app)

def test_read_root():
    # Robot akan mencoba mengakses halaman utama ("/")
    response = client.get("/")
    
    # Robot akan mengecek: Apakah statusnya 200 OK?
    assert response.status_code == 200
    # Robot akan mengecek: Apakah pesannya sesuai?
    assert response.json() == {"message": "Hello DevOps! Sistem berjalan normal."}