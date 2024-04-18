// Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    Player *player = g_game.getPlayerByName(recipient);

    // For checking if we need to delete the player pointer.
    bool shouldDelete = false;
    if (!player)
    {
        player = new Player(nullptr);
        shouldDelete = true;
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            // Delete the player pointer
            delete player;
            return;
        }
    }

    Item *item = Item::CreateItem(itemId);
    if (!item)
    {
        if (shouldDelete) {
            delete player;
        }

        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }

    // Check if we should delete the player pointer
    if (shouldDelete) {
        delete player;
    }
}
