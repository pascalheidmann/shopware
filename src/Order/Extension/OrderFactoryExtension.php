<?php declare(strict_types=1);

namespace Shopware\Order\Extension;

use Shopware\Api\Read\FactoryExtensionInterface;
use Shopware\Api\Search\QueryBuilder;
use Shopware\Api\Search\QuerySelection;
use Shopware\Context\Struct\TranslationContext;
use Shopware\Order\Event\OrderBasicLoadedEvent;
use Shopware\Order\Event\OrderDetailLoadedEvent;
use Shopware\Order\Struct\OrderBasicStruct;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

abstract class OrderFactoryExtension implements FactoryExtensionInterface, EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            OrderBasicLoadedEvent::NAME => 'orderBasicLoaded',
            OrderDetailLoadedEvent::NAME => 'orderDetailLoaded',
        ];
    }

    public function joinDependencies(
        QuerySelection $selection,
        QueryBuilder $query,
        TranslationContext $context
    ): void {
    }

    public function getDetailFields(): array
    {
        return [];
    }

    public function getBasicFields(): array
    {
        return [];
    }

    public function hydrate(
        OrderBasicStruct $order,
        array $data,
        QuerySelection $selection,
        TranslationContext $translation
    ): void {
    }

    public function orderBasicLoaded(OrderBasicLoadedEvent $event): void
    {
    }

    public function orderDetailLoaded(OrderDetailLoadedEvent $event): void
    {
    }
}