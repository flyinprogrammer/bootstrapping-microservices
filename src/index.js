const express = require("express");
const fs = require("fs");
const path = require("path");

//
// Throws an error if the PORT environment variable is missing.
//
if (!process.env.PORT) {
  throw new Error("Please specify the port number for the HTTP server with the environment variables PORT.");
}

const PORT = process.env.PORT;

console.log(`I will be listening on PORT: ${PORT}`);


const app = express();

app.get("/video", (req, res) => {
  const videoPath = path.join("./videos", "SampleVideo_1280x720_1mb.mp4");
  fs.stat(videoPath, (err, stats) => {
    if (err) {
      console.error("An error occurred ");
      res.sendStatus(500);
      return;
    }

    res.writeHead(200, {
      "Content-Length":  stats.size,
      "Content-Type": "video/mp4",
    });
    fs.createReadStream(videoPath).pipe(res);
  })
})

app.listen(PORT, () => {
  console.log(`Microservice listening on port ${PORT}, point your browser at http://localhost:${PORT}/video`);
});
