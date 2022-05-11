# Cabbage-Butterfly
We will analyze data of butterflies in this project <br>

The columns that were used are coreid, sex, country, year, left-wing width, left-wing length, left-wing apex, left-wing posterior spot, and left-wing anterior spot, and the same labels were used for the right-wing as the left-wing. The coreid is a unique ID for each butterfly that was recorded. Sex is stating whether the butterfly is male or female. The country is where the butterfly is from. The year is when the butterfly was recorded. The left-wing/right-wing width is the width of the wings in millimeters. The left-wing/right-wing length is the length of the wings in millimeters. The left-wing/right-wing apex column is the measurement from the tip of the wing to the bottom of the wing in millimeters. The left-wing/right-wing posterior spot is saying that the spot is in the bottom wing area. It is the measurement of how far the spot is from the vein of the wing. The left-wing/right-wing anterior is saying the spot is in the top wing area. It measures how far the spot is from the vein of the wing. 

Cleaning process:
    Gender:
        Male
        Female
        F
        M
        F?
        M?
        Unknown
    Location:
        USA
    Measurement = round up to the third decimal
** Drop any record that have 1 N/A value
    
