# DNA Complement App

Shiny web app to get the complement of a DNA sequence. This application only accepts valid DNA characters (A,T,C,G, and N as missing nucleotide).

## How to run

1. Clone this repository.
2. Build image with Docker.
```
docker build -t dna_complement:latest .
```
3. Run image with port 3838.
```
docker run -p 8080:3838 dna_complement:latest
```
4. Open your web browser and go to `http://localhost:8080/`
5. Run an example: Copy and paste the [DNA sequence of the human insulin in FASTA format](https://www.ncbi.nlm.nih.gov/nuccore/NC_000011.10?report=fasta&from=2159779&to=2161209&strand=true) into the input text box, and click the button.
