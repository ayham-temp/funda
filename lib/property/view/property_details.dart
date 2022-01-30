import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_assignment/common/helper.dart';
import 'package:funda_assignment/common/view/screen_padding.dart';
import 'package:funda_assignment/common/view/tag.dart';
import 'package:funda_assignment/property/cubit/property_cubit/property_cubit.dart';
import 'package:funda_assignment/property/model/property.dart';

class PropertyDetails extends StatelessWidget {
  final PropertyCubit propertyCubit;

  const PropertyDetails({Key? key, required this.propertyCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      bloc: propertyCubit,
      builder: (_, state) => state.when(
          loading: () => const CircularProgressIndicator(),
          ready: (property) => _Details(property: property),
          error: (message) => Text(message!)),
    );
  }
}

class _Details extends StatelessWidget {
  final Property property;

  const _Details({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(property.photo!),
        _Body(property: property),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          elevation: 8,
          shadowColor: Colors.black26,
          child: ContentPadding(
            child: _Header(property: property),
          ),
        ),
        const SizedBox(height: 8),
        ContentPadding(child: _AgentInfo(property: property)),
      ],
    );
  }
}

class _AgentInfo extends StatelessWidget {
  const _AgentInfo({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('OWNERS', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _AgentCard(name: property.agentName!, phone: property.agentPhone!),
      ],
    );
  }
}

class _AgentCard extends StatelessWidget {
  final String name;
  final String phone;

  const _AgentCard({
    Key? key,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text(name),
      subtitle: Text(phone),
      tileColor: Colors.white,
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Property property;

  const _Header({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MainInfo(property: property),
        const Divider(height: 24),
        _Features(property: property),
        const Divider(height: 24),
        _PropertyArea(area: property.area!)
      ],
    );
  }
}

class _PropertyArea extends StatelessWidget {
  const _PropertyArea({Key? key, required this.area}) : super(key: key);
  final double area;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('AREA', style: Theme.of(context).textTheme.caption),
        const Spacer(),
        Text(area.toString(), style: Theme.of(context).textTheme.headline6),
        const SizedBox(width: 4),
        Text('sqft', style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}

class _Features extends StatelessWidget {
  const _Features({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Feature(
          title: 'Baths',
          count: property.numOfBathRms ?? 0,
          iconData: Icons.shower_outlined,
        ),
        _Feature(
          title: 'Beds',
          count: property.numOfBedRms ?? 0,
          iconData: Icons.bed_rounded,
        ),
        const _Feature(
          title: 'Garage',
          count: 1,
          iconData: Icons.garage_outlined,
        ),
        const _Feature(
          title: 'Floors',
          count: 1,
          iconData: Icons.layers_outlined,
        ),
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({
    Key? key,
    required this.iconData,
    required this.title,
    required this.count,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(iconData, color: Colors.grey),
            const SizedBox(
              width: 4,
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Text(title, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}

class _MainInfo extends StatelessWidget {
  const _MainInfo({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PropertyType(property: property),
            const SizedBox(height: 4),
            _PropertyPrice(property: property),
            const SizedBox(height: 4),
            _PropertyAddress(property: property),
          ],
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Tag(
            label: Text('OPEN'),
          ),
        ),
      ],
    );
  }
}

class _PropertyAddress extends StatelessWidget {
  const _PropertyAddress({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 18),
        Text(property.address!),
      ],
    );
  }
}

class _PropertyPrice extends StatelessWidget {
  const _PropertyPrice({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencyFormat.format(property.price),
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class _PropertyType extends StatelessWidget {
  const _PropertyType({Key? key, required this.property}) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Text(
      property.propertyType!.toUpperCase(),
      style: Theme.of(context).textTheme.caption,
    );
  }
}
