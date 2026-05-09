# PostGIS

## Description
PostGIS is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects allowing location queries to be run in SQL.

## How to code it
```sql
-- Enable PostGIS
CREATE EXTENSION postgis;

-- Create table with geometry column
CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location GEOMETRY(Point, 4326) -- SRID 4326 is WGS84 (lat/long)
);

-- Insert data
INSERT INTO stores (name, location)
VALUES ('Coffee Shop', ST_GeomFromText('POINT(-73.9857 40.7484)', 4326));

-- Query: Find stores within 5km of a point
SELECT name 
FROM stores 
WHERE ST_DWithin(
  location, 
  ST_GeomFromText('POINT(-73.9857 40.7484)', 4326), 
  5000 -- distance in meters
);
```

## Features
- Geometry types: Point, LineString, Polygon, MultiPoint, etc.
- Spatial predicates for determining spatial relationships (overlaps, touches, contains).
- Spatial operators for determining geometric measurements (distance, area, perimeter).
- Proximity analysis and clustering.
- Used by Uber, Mapbox, and OpenStreetMap.
