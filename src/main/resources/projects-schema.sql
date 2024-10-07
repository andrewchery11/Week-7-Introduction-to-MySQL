-- remove the project_category table if it exists
DROP TABLE IF EXISTS project_category;

-- remove the material table if it exists
DROP TABLE IF EXISTS material;

-- remove the step table if it exists
DROP TABLE IF EXISTS step;

-- remove the category table if it exists
DROP TABLE IF EXISTS category;

-- remove the project table if it exists
DROP TABLE IF EXISTS project;


-- create a new table for projects
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,  -- each project gets a unique number that adds up automatically
    project_name VARCHAR(128) NOT NULL,         -- the name of the project, must be filled in
    estimated_hours DECIMAL(7,2),               -- how many hours you think it will take, can be empty
    actual_hours DECIMAL(7,2),                  -- how many hours it actually took, can be empty
    difficulty INT,                             -- a number to show how hard the project is, can be empty
    notes TEXT                                  -- extra notes about the project, can be empty
);

-- create a new table for materials
CREATE TABLE material (
    material_id INT AUTO_INCREMENT PRIMARY KEY, -- each material gets a unique number that adds up automatically
    project_id INT NOT NULL,                    -- links to the project this material belongs to, must be filled in
    material_name VARCHAR(128) NOT NULL,        -- name of the material, must be filled in
    num_required TINYINT,                       -- how many of this material you need, can be empty
    cost DECIMAL(7,2),                          -- cost of the material, can be empty
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE  -- if a project is deleted, delete all materials
);

-- create a new table for steps in the project
CREATE TABLE step (
    step_id INT AUTO_INCREMENT PRIMARY KEY,     -- each step gets a unique number that adds up automatically
    project_id INT NOT NULL,                    -- links to the project this step belongs to, must be filled in
    step_text TEXT NOT NULL,                    -- the details of the step, must be filled in
    step_order INT NOT NULL,                    -- the order of this step in the project, must be filled in
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE  -- if a project is deleted, delete all steps
);

-- create a new table for categories
CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY, -- each category gets a unique number that adds up automatically
    category_name VARCHAR(128) NOT NULL         -- the name of the category, must be filled in
);

-- create a new table to connect projects and categories
CREATE TABLE project_category (
    project_id INT NOT NULL,                    -- links to the project, must be filled in
    category_id INT NOT NULL,                   -- links to the category, must be filled in
    PRIMARY KEY (project_id, category_id),      -- makes sure each project-category pair is unique
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,  -- if a project is deleted, remove its categories
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE  -- if a category is deleted, remove projects
);