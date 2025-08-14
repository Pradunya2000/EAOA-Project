FROM python:3.10-slim

# 1. Set working directory
WORKDIR /app

# 2. Copy only requirements first to leverage Docker caching
COPY requirements.txt .

# 3. Install dependencies without cache and remove pip cache folder
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/pip

# 4. Copy the rest of the project
COPY . .

# 5. Optional: remove apt cache if you install system packages
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 6. Run the application
CMD ["python", "main.py"]
