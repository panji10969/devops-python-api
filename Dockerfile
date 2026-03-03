# 1. Gunakan OS Linux berukuran mini yang sudah terinstal Python
FROM python:3.9-slim

# 2. Buat folder bernama /app di dalam container sebagai ruang kerja
WORKDIR /app

# 3. Masukkan file Daftar Belanjaan (requirements.txt) ke dalam container
COPY requirements.txt .

# 4. Perintahkan container untuk membeli/menginstal isi daftar belanjaan tersebut
RUN pip install --no-cache-dir -r requirements.txt

# 5. Masukkan seluruh kode aplikasi (main.py) kita ke dalam container
COPY . .

# 6. Buka "Pintu" nomor 8000 agar tamu (kita) bisa masuk mengaksesnya
EXPOSE 8000

# 7. SOP terakhir: Nyalakan server web-nya menggunakan uvicorn!
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]