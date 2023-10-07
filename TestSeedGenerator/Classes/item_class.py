class inv_item:
    def __init__(self, item_id, name, unlocks=None):
        self.item_id = item_id
        self.name = name
        self.unlocks = unlocks

    def __str__(self):
        return f"Item ID: {self.item_id}, Name: {self.name}, Unlocks: {self.unlocks}"


