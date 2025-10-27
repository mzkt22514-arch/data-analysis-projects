/*
CREATE TABLE Sep2025JunkDB.kadijah_thompson.planned_makes (
    id INT PRIMARY KEY,
    project_title VARCHAR(100),
    type VARCHAR(50),
    target_audience VARCHAR(100),
    estimated_budget DECIMAL(10, 2),
    due_date DATE
);

INSERT INTO Sep2025JunkDB.kadijah_thompson.planned_makes 
(id, project_title, type, target_audience, estimated_budget, due_date)
VALUES
(1, 'Flavor Haus Cookbook Vol. 1', 'Cookbook', 'Foodies & Home Chefs', 200.00, '2025-12-15'),
(2, 'Flavor Haus Kids Coloring Book', 'Coloring Book', 'Parents & Kids', 75.00, '2025-11-20'),
(3, 'Creole Mac & Cheese Recipe', 'Recipe', 'Social Media Followers', 20.00, '2025-10-30');

UPDATE Sep2025JunkDB.kadijah_thompson.planned_makes
SET estimated_budget = 50.00
WHERE id = 3;

DELETE FROM Sep2025JunkDB.kadijah_thompson.planned_makes
WHERE id = 2;

DROP TABLE Sep2025JunkDB.kadijah_thompson.planned_makes;
*/