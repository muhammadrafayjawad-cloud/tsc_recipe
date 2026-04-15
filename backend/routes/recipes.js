import express from 'express';
import { ObjectId } from 'mongodb';

const router = express.Router();

// GET all recipes
router.get('/', async (req, res) => {
  try {
    const recipes = await req.db.collection('recipes')
      .find({})
      .sort({ createdAt: -1 })
      .toArray();
    res.json({ success: true, data: recipes });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// GET single recipe by ID
router.get('/:id', async (req, res) => {
  try {
    const recipe = await req.db.collection('recipes')
      .findOne({ _id: new ObjectId(req.params.id) });
    
    if (!recipe) {
      return res.status(404).json({ success: false, error: 'Recipe not found' });
    }
    res.json({ success: true, data: recipe });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// POST save recipe (from webhook)
router.post('/save', async (req, res) => {
  try {
    const recipe = {
      ...req.body,
      createdAt: new Date(),
      updatedAt: new Date()
    };

    const result = await req.db.collection('recipes').insertOne(recipe);
    
    res.json({
      success: true,
      message: 'Recipe saved successfully',
      _id: result.insertedId,
      data: { ...recipe, _id: result.insertedId }
    });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// POST webhook endpoint (from n8n)
router.post('/webhook', async (req, res) => {
  try {
    const recipe = {
      ...req.body,
      createdAt: new Date(),
      updatedAt: new Date()
    };

    const result = await req.db.collection('recipes').insertOne(recipe);
    
    res.json({
      success: true,
      message: 'Recipe received and saved',
      _id: result.insertedId,
      ...recipe
    });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// DELETE recipe
router.delete('/:id', async (req, res) => {
  try {
    const result = await req.db.collection('recipes')
      .deleteOne({ _id: new ObjectId(req.params.id) });
    
    if (result.deletedCount === 0) {
      return res.status(404).json({ success: false, error: 'Recipe not found' });
    }
    
    res.json({ success: true, message: 'Recipe deleted successfully' });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

// UPDATE recipe
router.put('/:id', async (req, res) => {
  try {
    const recipe = {
      ...req.body,
      updatedAt: new Date()
    };

    const result = await req.db.collection('recipes')
      .findOneAndUpdate(
        { _id: new ObjectId(req.params.id) },
        { $set: recipe },
        { returnDocument: 'after' }
      );
    
    if (!result.value) {
      return res.status(404).json({ success: false, error: 'Recipe not found' });
    }
    
    res.json({ success: true, data: result.value });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

export default router;
