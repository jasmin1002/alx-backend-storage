-- Create index on existing table
DROP INDEX idx_name_first ON names;

CREATE INDEX idx_name_first
ON names(name(1), score);