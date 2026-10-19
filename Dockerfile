FROM python
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
# Удаляем символы возврата каретки (\r), превращая CRLF в LF
RUN sed -i 's/\r$//' /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY . .
ENTRYPOINT ["/entrypoint.sh"]