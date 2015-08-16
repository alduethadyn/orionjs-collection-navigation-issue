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


#@Ingredients = new orion.collection 'ingredients',
#    singularName: 'ingredient'
#    pluralName: 'ingredients'
#    link: { title: 'Ingredients', index: 6 }
#    tabular: {
#      columns: [
#        { data: 'name', title: 'Name' }
#        { data: 'type', title: 'Type' }
#        { data: 'unit', title: 'Unit of Measure' }
#        orion.attributeColumn('createdBy', 'createdBy', 'Created By')
#      ]
#    }
#
#@Ingredients.attachSchema new SimpleSchema
#    name: { type: 'String' }
#    type: { type: 'String' }
#    unit: orion.attribute('hasOne', { label: 'Unit of Measure' }, { collection: Units, titleField: 'name', publicationName: 'units' })
#    createdBy: orion.attribute('createdBy')
#
#
#@Recipes = new orion.collection 'recipes',
#    singularName: 'recipe'
#    pluralName: 'recipes'
#    link: { title: 'Recipes', index: 5 }
#    tabular: {
#      columns: [
#        { data: 'title', title: 'Title' }
#        { data: 'ingredients', title: 'Ingredients' }
#        orion.attributeColumn('froala', 'steps', 'Steps')
#        orion.attributeColumn('createdBy', 'createdBy', 'Created By')
#      ]
#    }
#
#@Recipes.attachSchema new SimpleSchema
#    title: { type: 'String' }
#    ingredients: { type: 'String' }
#    steps: orion.attribute('froala', label: 'Steps')
#    createdBy: orion.attribute('createdBy')
#
#
#@Menus = new orion.collection 'menus',
#    singularName: 'menu'
#    pluralName: 'menus'
#    link: { title: 'Menus', index: 4 }
#    tabular: {
#      columns: [
#        { data: 'week', title: 'Week' }
#        { data: 'days', title: 'Days' }
#        orion.attributeColumn('froala', 'post', 'Post Content')
#        orion.attributeColumn('createdBy', 'createdBy', 'Created By')
#      ]
#    }
#
#@Menus.attachSchema new SimpleSchema
#    week: { type: 'String' }
#    days: { type: 'String' }
#    post: orion.attribute('froala', { label: 'Post' })
#    createdBy: orion.attribute('createdBy')
#
## not sure about this notion yet
#@Customers = new orion.collection 'customers',
#    singularName: 'customer'
#    pluralName: 'customers'
#    link: { title: 'Customers', index: 1 }
#    tabular: {
#      columns: [
#        { data: 'name', title: 'Name' }
#        { data: 'email', title: 'Email' }
#        orion.attributeColumn('createdBy', 'createdBy', 'Created By')
#      ]
#    }
#
#@Customers.attachSchema new SimpleSchema
#    name: { type: 'String' }
#    email: { type: 'String' }
#    createdBy: orion.attribute('createdBy')
#
#
#@Orders = new orion.collection 'orders',
#    singularName: 'order'
#    pluralName: 'orders'
#    link: { title: 'Orders', index: 0 }
#    tabular: {
#      columns: [
#        { data: 'id', title: 'ID' }
#        { data: 'status', title: 'Status' }
#        { data: 'customer', title: 'Customer' }
#      ]
#    }
#
#@Orders.attachSchema new SimpleSchema
#    id: { type: String }
#    status: { type: String }
#    customer: orion.attribute('hasOne', { type: String, label: 'Customer' }, { collection: Customers, titleField: 'name', publicationName: 'customers' })
#    

#Prep

# Shopify Collections
ShopifyOrders = new Mongo.Collection 'shopify_orders'
ShopifyCustomers = new Mongo.Collection 'shopify_customers'
ShopifyProducts = new Mongo.Collection 'shopify_products'
