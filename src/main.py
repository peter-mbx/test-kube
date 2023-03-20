from fastapi import FastAPI

app = FastAPI()


@app.get("/hello/{name}")
async def say_hello(name: str):
    return f"Hello {name}"
