### globals orion ###

@Products = new orion.collection 'products',
  singularName: 'product'
  pluralName: 'products'
  link: { title: 'Products', index: 2 }
  tabular: {
    columns: [
      { data: 'name', title: 'Name' }
      orion.attributeColumn('file', 'image', 'Image')
      orion.attributeColumn('froala', 'description', 'Description')
      orion.attributeColumn('createdBy', 'createdBy', 'Created By')
    ]
  }

@Products.attachSchema new SimpleSchema
  name: { type: 'String' }
  image: orion.attribute('file', { label: 'Image', optional: true })
  description: orion.attribute('froala', label: 'Body')
  createdBy: orion.attribute('createdBy')


@Plans = new orion.collection 'plans',
  singularName: 'plan'
  pluralName: 'plans'
  link: { title: 'Plans', index: 3 }
  tabular: {
    columns: [
      { data: 'name', title: 'Name' }
      orion.attributeColumn('hasMany', 'meals', 'Meals')
      orion.attributeColumn('file', 'image', 'Image')
      orion.attributeColumn('froala', 'description', 'Description')
      orion.attributeColumn('createdBy', 'createdBy', 'Created By')
    ]
  }

@Plans.attachSchema new SimpleSchema
  name: { type: 'String' }
  meals: orion.attribute('hasMany', { label: 'Meals' }, { collection: Products, titleField: 'name', publicationName: 'products' })
  image: orion.attribute('file', { label: 'Image', optional: true })
  description: orion.attribute('froala', { label: 'Description' })
  createdBy: orion.attribute('createdBy')


@Units = new orion.collection 'units',
    singularName: 'unit'
    pluralName: 'units'
    link: { title: 'Units', index: 7 }
    tabular: {
      columns: [
        { data: 'name', title: 'Name' }
        { data: 'abbreviation', title: 'Abbreviation' }
        orion.attributeColumn('createdBy', 'createdBy', 'Created By')
      ]
    }

@Units.attachSchema new SimpleSchema
    name: { type: String }
    abbreviation: { type: String, optional: true }
    createdBy: orion.attribute('createdBy')
