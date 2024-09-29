CREATE OR REPLACE FUNCTION `annular-fold-436407-e0.keepcoding.clean_integer`(input_integer INT64)
RETURNS INT64 AS (
    IF(input_integer IS NULL, -999999, input_integer)
);