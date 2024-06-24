/**
 * @see BiPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class CollectorTest {

    /**
     * @see Collector.of
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        ISupplier stringListSupplier = Supplier.of(List<Object>.class);
        ISupplier objectByStringMapSupplier = Supplier.of(Map<String, Object>.class);
        IFunction getNameFunction = new AfTestCommons.GetFieldFunction(Account.Name);
        IFunction getTypeFunction = new AfTestCommons.GetFieldFunction(Account.Type);
        IBiConsumer addNameToListBiConsumer = new AfTestCommons.AddToListBiConsumer(getNameFunction);
        Collector toNameListCollector = Collector.of(stringListSupplier, addNameToListBiConsumer);
        IBiConsumer putToNameByTypeMapBiConsumer = new AfTestCommons.PutToObjectsByStringMapBiConsumer(toNameListCollector, getTypeFunction);
        IFunction groupByStringFinisherFunction = new AfTestCommons.GroupByStringFinisherFunction(toNameListCollector.finisher());
        Collector groupNamesByTypeCollector = Collector.of(objectByStringMapSupplier, putToNameByTypeMapBiConsumer, groupByStringFinisherFunction);
        // When
        ICollector toNameStringListCollector = toNameListCollector.cast(List<String>.class);
        ICollector groupStringNamesByTypeCollector = groupNamesByTypeCollector.cast(Map<String, List<String>>.class);
        // Then
        Assert.areEqual(new List<String>(), toNameStringListCollector.supplier().get());
        Assert.areEqual(addNameToListBiConsumer, toNameStringListCollector.accumulator());
        Assert.areEqual(null, toNameStringListCollector.finisher());
        Assert.areEqual(new Map<String, List<String>>(), groupStringNamesByTypeCollector.supplier().get());
        Assert.areEqual(putToNameByTypeMapBiConsumer, groupStringNamesByTypeCollector.accumulator());
        Assert.areEqual(groupByStringFinisherFunction, groupStringNamesByTypeCollector.finisher());
    }

    /**
     * @see Collector.of
     */
    @IsTest
    static void default() {
        // Given
        ISupplier stringListSupplier = Supplier.of(List<Object>.class);
        ISupplier objectByIntMapSupplier = Supplier.of(Map<Integer, Object>.class);
        IFunction getNameFunction = new AfTestCommons.GetNameFunction();
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        IBiConsumer addNameToListBiConsumer = new AfTestCommons.AddToListBiConsumer(getNameFunction);
        Collector toNameListCollector = Collector.of(stringListSupplier, addNameToListBiConsumer);
        IBiConsumer putToNameByAgeMapBiConsumer = new AfTestCommons.PutToObjectsByStringMapBiConsumer(toNameListCollector, getAgeFunction);
        IFunction groupByStringFinisherFunction = new AfTestCommons.GroupByStringFinisherFunction(toNameListCollector.finisher());
        Collector groupNamesByAgeCollector = Collector.of(objectByIntMapSupplier, putToNameByAgeMapBiConsumer, groupByStringFinisherFunction);
        // When
        ICollector toNameStringListCollector = toNameListCollector.cast(List<String>.class);
        ICollector groupStringNamesByAgeCollector = groupNamesByAgeCollector.cast(Map<Integer, List<String>>.class);
        // Then
        Assert.areEqual(new List<String>(), toNameStringListCollector.supplier().get());
        Assert.areEqual(addNameToListBiConsumer, toNameStringListCollector.accumulator());
        Assert.areEqual(null, toNameStringListCollector.finisher());
        Assert.areEqual(new Map<Integer, List<String>>(), groupStringNamesByAgeCollector.supplier().get());
        Assert.areEqual(putToNameByAgeMapBiConsumer, groupStringNamesByAgeCollector.accumulator());
        Assert.areEqual(groupByStringFinisherFunction, groupStringNamesByAgeCollector.finisher());
    }

}
