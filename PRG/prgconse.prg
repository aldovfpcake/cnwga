SET PATH TO f:\sueldos\empre1
SELECT r.legajo,p.nombre,r.desc FROM reintegro as r INNER JOIN personal as p ON r.legajo = p.legajo INTO TABLE f:\sueldos\nwga\datos\reintegro2