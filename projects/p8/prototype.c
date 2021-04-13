#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <getopt.h>

void WriteJulia(FILE * f, int w, int h, double p);

int main(int argc, char * argv[]) {
	int c;
	int width = 255, height = 255;
	double parameter = 0;
	char * file_name = NULL;
	FILE * file = stdout;

	while ((c = getopt(argc, argv, "w:h:p:f:")) != -1) {
		switch (c) {
			case 'w':
				width = atoi(optarg);
				break;

			case 'h':
				height = atoi(optarg);
				break;

			case 'p':
				parameter = atof(optarg);
				break;

			case 'f':
				file_name = optarg;
				break;
		}
	}
	if (file_name != NULL)
		file = fopen(file_name, "w");
	if (file != NULL) {
		fprintf(file, "P3\n%d %d\n255\n", width, height);
		WriteJulia(file, width, height, parameter);
	}
	if (file != stdout && file != NULL)
		fclose(file);
	return 0;
}

int min(a, b) {
	return (a < b) ? a : b;
}

int max(a, b) {
	return (a > b) ? a : b;
}

/*	Adapted from: http://www.cs.uu.nl/docs/vakken/magr/2017-2018/files/SIMD%20Tutorial.pdf
*/
void WriteJulia(FILE * f, int w, int h, double p) {
	double scale = 1 + cosf(p);
	for (int y = 0; y < h; y++) {
		double yoffs = ((double)y / h - 0.5f) * scale; 
		double xoffs = -0.5f * scale;
		double dx = scale / w; 
		for (int x = 0; x < w; x++, xoffs += dx) {
			double ox = 0, oy = 0, py, px;
			for (int i = 0; i < 99; i++) {
				px = ox;
				py = oy;
				oy = -(py * py - px * px - 0.55 + xoffs);
				ox = -(px * py + py * px - 0.55 + yoffs);
			}
			int r = min(255, max(0, (int)(ox * 255))); 
			int g = min(255, max(0, (int)(oy * 255)));
			fprintf(f, " %d %d 0 ", r, g);
		}
		fprintf(f, "\n");
	}
}

