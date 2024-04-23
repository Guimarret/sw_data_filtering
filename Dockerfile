FROM public.ecr.aws/lambda/python:3.11.2024.04.17.17

COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

COPY etl/ ./

CMD [ "extract.lambda_handler" ]