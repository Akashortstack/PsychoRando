class world_location:
    def __init__(self, location_id, name, requirements=None):
        self.location_id = location_id
        self.name = name
        if requirements is None:
            self.requirements = []
        else:
            self.requirements = requirements

    def __str__(self):
        return f"Location ID: {self.location_id}, Name: {self.name}, Requirements: {', '.join(self.requirements)}"
