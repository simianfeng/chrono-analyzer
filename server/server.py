from flask import Flask
import fastai.vision from fastai
app= Flask(__name__)

CLASSIFIER = fastai.load_learner("../models", "classifier.pkl")
@app.route("/classify")

def classify():
    image= fastai.image.open_image("./seiko-monster.jpg")
    prediction= CLASSIFIER.predict(image)
    return {
      "brandPrediction": sorted(
        list(
          zip(
          CLASSIFIER.data.classes,
          [round(x,4) for x in map(float, prediction[2])]
          )
        ),
        key=lambda p:p[1],
        reverse= True;
      )

    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
